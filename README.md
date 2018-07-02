# wort-archives
Archive scripts for WORT-FM.  Original scripts by Nathan McQuillen

`archive_record`: runs every 15 minutes (on 0) and records 15 minute sections to /mnt/aircheck/15 Minute Slices.
`bootstrap_autoarchive`: runs every 15 minutes (on 0) to start the autoarchive process if it isn't running already.
`archive_rsync`: runs every 15 minutes (on 1) to copy new files created by bootstrap_autoarchive out to stream.wortfm.org
`autoarchive`: run by bootstrap_autoarchive.  Records programs to files.  Uses `at` to start itself again while still running to catch overlap at the end of the programs.
`crontab`: Cron jobs as found on 6/18
`2018-06-18 Analysis.md`: Jon's analysis from 6/18/2018.
