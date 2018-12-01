#!/usr/bin/perl

($hr,$min,$sec) = $ARGV[0] =~ /(\w\w):(\w\w):(\w\w)/;
$sec="00";
$min=($min < 30?"00":"30");
$time = "$hr:$min:$sec";


$dow = $ARGV[1];

use Data::Dumper;

@dayarr = (
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
);

%daymap = (
    'Sun' => 0,
    'Mon' => 1,
    'Tue' => 2,
    'Wed' => 3,
    'Thu' => 4,
    'Fri' => 5,
    'Sat' => 6
);

{
   local $/ ;    # slurp mode
  open $smd, "<", "/var/www/scripts/spinitron-scripts/schedmap.dat";
  %showinfo = %{ eval(<$smd>)};
#print Dumper(\%showinfo);
}

# {
#                                   'ShowID' => 833,
#                                   'OnairTime' => '23:00:00',
#                                   'Scheduled' => undef,
#                                   'OffairTime' => '02:00:00',
#                                   'ShowName' => 'Not Too Shabby',
#                                   'OtieTag' => 'shabby'
#                                 },


foreach $time (keys %showinfo){
  foreach $dow (keys %{$showinfo{$time}}){
#print Dumper($showinfo{$time}{$dow});
#print "$showinfo{$time}{$dow}{'ShowName'},$showinfo{$time}{$dow}{'ShowID'},$showinfo{$time}{$dow}{'OtieTag'},$showinfo{$time}{$dow}{'OnairTime'},$showinfo{$time}{$dow}{'OffairTime'}\n";
print "$showinfo{$time}{$dow}{'ShowName'},$dow,$dayarr[$dow],$showinfo{$time}{$dow}{'OnairTime'},$showinfo{$time}{$dow}{'OffairTime'}\n";
  }
}
