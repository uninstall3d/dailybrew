#!/bin/zsh

logdir=$HOME/Library/Logs/Homebrew/dailybrew/$(date +%Y/%m)
logfile=${logdir}/$(date +%Y-%m-%d-%H%M%S).log

if [ ! -d ${logdir} ]; then
  mkdir -p ${logdir}
fi

echo "Going to the doctor..."
brew doctor >> ${logfile} 2>&1

echo "Search for missing brew..."
brew missing >> ${logfile} 2>&1

echo "Finding new brew..."
brew update >> ${logfile} 2>&1

echo "Drinking brew..."
brew upgrade >> ${logfile} 2>&1

echo "Cleanup the mess..."
brew cleanup >> ${logfile} 2>&1

echo "Daily brew report at '$HOME/Library/Logs/Homebrew/dailybrew/'"