#!/usr/bin/env node
import process from 'process';
import fs from 'fs';
import path from 'path';
import commandLineArgs from 'command-line-args';
import chalk from 'chalk';
import chalkAnimation from 'chalk-animation';
const optionDefinitions = [
    { name: 'dotRoot', type: String, defaultOption: true, defaultValue: `${process.env.HOME}/dotfiles` },
    { name: 'backupDir', type: String, defaultValue: `${process.env.HOME}/dotfiles/backup-dotfiles` },
    { name: 'backupLocalOnly', type: Boolean, defaultValue: false },
    { name: 'backup', type: Boolean, defaultValue: true }
];
const options = commandLineArgs(optionDefinitions);
const safeExecute = (action, errorMessage) => {
    try {
        action();
    }
    catch (error) {
        console.error(chalk.black.bgRed.bold(errorMessage), error);
        process.exit(1);
    }
};
const setPwdToDotRoot = () => {
    safeExecute(() => {
        process.chdir(options.dotRoot);
    }, 'Failed to change directory:');
    console.log('Changed directory to:', chalk.yellow(options.dotRoot));
};
// Backup .local files
const backupDotfiles = () => {
    const date = new Date().toISOString().replace(/T/, '_').replace(/:/g, '-').split('.')[0];
    const backupDir = path.join(options.backupDir, date);
    console.log('Created backup directory:', chalk.magenta(backupDir));
    safeExecute(() => {
        fs.mkdirSync(backupDir, { recursive: true });
        const directories = ['aliases', 'nvim', 'scripts', 'tmux/sessions'];
        directories.forEach(dir => {
            const dirPath = path.join(backupDir, dir);
            fs.mkdirSync(dirPath, { recursive: true });
            console.log('Created backup directory: ->', chalk.magenta(dirPath));
            // Copy .local files to the backup directory
            const localFiles = fs.readdirSync(dir).filter(file => file.endsWith('.local'));
            localFiles.forEach(file => {
                fs.copyFileSync(path.join(options.dotRoot, dir, file), path.join(backupDir, dir, file));
                console.log('Copied file to backup:     --->', chalk.magenta(path.join(backupDir, dir, file)));
            });
        });
    }, 'Failed to create backup directories:');
};
const ensureDirectoriesExist = (directories) => {
    directories.forEach(dir => {
        const fullPath = path.join(process.env.HOME || '', dir);
        if (!fs.existsSync(fullPath)) {
            fs.mkdirSync(fullPath, { recursive: true });
            console.log('Created directory:', chalk.green(fullPath));
        }
        else {
            console.log('Directory already exists:', chalk.yellow(fullPath));
        }
    });
};
const installDotfile = (sourcePath, destinationPath, backupPath, type) => {
    safeExecute(() => {
        // if sourcePath does not exist throw an error
        if (!fs.existsSync(sourcePath)) {
            throw new Error(`File does not exist: ${sourcePath}`);
        }
        // if destinationFile exists, move it to the backup directory
        if (fs.existsSync(destinationPath)
            && backupPath !== null
            && options.backup) {
            fs.renameSync(destinationPath, backupPath);
            console.log('Moved to backup:', chalk.magenta(destinationPath));
            console.log('  -> ', chalk.magenta(path.join(backupPath, path.basename(destinationPath))));
        }
        // if a symlink already exists at destinationPath, remove it
        if (fs.existsSync(destinationPath) && fs.lstatSync(destinationPath).isSymbolicLink()) {
            fs.unlinkSync(destinationPath);
            console.log('Removed existing symlink:', chalk.red(destinationPath));
        }
        fs.symlinkSync(sourcePath, destinationPath, type);
        console.log('Created symlink:', chalk.green(destinationPath));
    }, 'Failed to install dotfile:');
};
if (options.backupLocalOnly) {
    setPwdToDotRoot();
    backupDotfiles();
    process.exit(0);
}
setPwdToDotRoot();
backupDotfiles();
ensureDirectoriesExist([
    '.config',
    '.vim',
    '.vim/sessions',
    '.vim/swapfiles',
    '.vim/undofiles',
    '.tmux/plugins/tpm'
]);
installDotfile(`${options.dotRoot}/nvim`, `${process.env.HOME}/.config/nvim`, null, 'dir');
installDotfile(`${options.dotRoot}/submodules/zsh-autosuggestions`, `${process.env.HOME}/.oh-my-zsh/plugins/zsh-autosuggestions`, null, 'dir');
installDotfile(`${options.dotRoot}/submodules/zsh-syntax-highlighting`, `${process.env.HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting`, null, 'dir');
installDotfile(`${options.dotRoot}/bat`, `${process.env.HOME}/.config/bat`, null, 'dir');
installDotfile(`${options.dotRoot}/tmux.conf`, `${process.env.HOME}/.tmux.conf`, null, 'file');
installDotfile(`${options.dotRoot}/rsync-excludes`, `${process.env.HOME}/.rsync-excludes`, null, 'file');
installDotfile(`${options.dotRoot}/git/gitconfig`, `${process.env.HOME}/.gitconfig`, null, 'file');
const finishAnimation = chalkAnimation.rainbow('Installation complete!');
setTimeout(() => {
    finishAnimation.stop();
}, 5000);
