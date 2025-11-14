# Unix commands

## Paths, directories
Use _tab_ for name completion. Current directory is
indicated as (.), parent directory as (..) and home
directory as (∼).
```sh
ls                # print directory content
ls -a             # also include hidden files
ls my/sub/folder  # look into specified folder
mkdir mynewfolder # create new folder
cd mynewfolder    # change directory
cd                # go to home directory
pwd               # print working director
```

## Copy, move, remove, search
```sh
cp file1 file2    # copy file1, create file2
mv file1 file2    # move file1 to file2
rm file1          # remove file
rmdir folder1     # remove folder
clear             # clear terminal window
cat file1.txt     # print file content
less file1.txt    # display scrollable content,
Q                 # quit
head file1.txt    # print first 10 lines of file
tail file1.txt    # print last 10 lines of file
grep word f1.txt  # print lines containing word
grep ’a e’ f1.txt # search phrase
wc -w f1.txt      # count nb of words in file
```

## Redirection and pipes
The standard output is the terminal screen, the standard input is the keyboard, and the standard error, where processes write error messages, is also the terminal screen. It is possible to change the default behavior and redirect input or outputs.  
For example, if cat is used without arguments, it listens to the keyboard. Hence by typing cat, then a few words on the keyboard, then Ctrl-D to end the input, it displays these words on the standard output, which is the terminal.  
For successive operations where every operation has to pass its output to be the input of the next operation, we can use pipes |.
```sh
cat > f1      # store keyboard inputs in file
cat » f2      # append standard input to file
cat f1 f2 » f # join files
sort < f      # take input from file and sort it alphabetically or numerically
sort < f > fs # sort inputs from file f1 and write outputs in file fs
who           # return users connected to PC
who | sort    # pass users to sort command
```

## Wildcard, help
The wilcard * character matches against none or more characters in a file or directory name, while the character ? matches exactly one character.
```sh
ls *.tex        # list all files with extension .tex
f?.txt          # is a match for f1.txt, f2.txt, fs.txt
man wc          # manual for command wc
whatis wc       # one-line description
apropos keyword # when unsure, returns all commands with keyword in their manual page header
```

## Acess and processes
Command list -l returns more info, such as permissions associated with files. A d at the beginning indicates a directory, otherwise a - indicates a file. Then the 9 symbols are access rights.  
First 3 characters are permission for the user, then for the group, then for all other users. r is read permisson, w is write permission, w is execution permission (or right to access files for a directory).  
Processes are identified by unique PID (process identifiers). Processes may be in the foreground, background or suspended. Backgrounding a long process returns the terminal prompt immediatly, and the process continues executing in the background.  
```sh
chmod go-rw f1 # For group (g) and other (o), remove (-) read (r), write (w) permissons.
chmod a+rwx f1 # For all (a), add (+) read (r), write (w), execute (x) permissons.
jobs           # list current jobs
command &      # run command in background
ˆZ             # suspend the foreground job
ˆZ + bg        # suspend and move job to background
ˆC             # kill the foreground running job
kill 3         # kill process with job number 3
ps             # information about processes
kill 21872     # kill process number 21872
kill -9 21872  # if above doesn’t work, use -9
```

## Compress, compare, history
```sh
gzip f1.txt        # compress to f1.txt.gz
gzip f1.txt.gz     # extract to f1.txt
zcat f1.txt.gz     # read without extracting
file *             # information on file types
diff f1 f2         # differences between files, side < is f1 and > is f2
find . -size +1M   # search files over 1Mb
find -name "*.tex" # list tex files
history            # list previous commands
!5                 # execute fith command in history
!!                 # execute last command
!-3                # execute third most recent command
!grep              # execute last command starting with grep
set history=100    # increase history list size
```