#!/usr/bin/perl

($hr,$min,$sec) = $ARGV[0] =~ /(\w\w):(\w\w):(\w\w)/;
$sec="00";
$min=($min < 30?"00":"30");
$time = "$hr:$min:$sec";


$dow = $ARGV[1];

#use Data::Dumper;

%daymap = (
    'Sun' => 0,
    'Mon' => 1,
    'Tue' => 2,
    'Wed' => 3,
    'Thu' => 4,
    'Fri' => 5,
    'Sat' => 6
);

  open $smd, "<", "/var/www/scripts/spinitron-scripts/schedmap.dat";
{
   local $/;    # slurp mode
  %showinfo = %{ eval(<$smd>)};
}

#print Dumper($showinfo{$time}{$dow});
print "$showinfo{$time}{$dow}{'ShowName'},$showinfo{$time}{$dow}{'ShowID'},$showinfo{$time}{$dow}{'OtieTag'},$showinfo{$time}{$dow}{'OnairTime'},$showinfo{$time}{$dow}{'OffairTime'}\n";
