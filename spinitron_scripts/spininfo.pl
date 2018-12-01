#!/usr/bin/perl

use JSON::XS;
use Data::Dumper;

$fetch = 0;

# simple and fast interfaces (expect/generate UTF-8)
 
#$utf8_encoded_json_text = encode_json $perl_hash_or_arrayref;
#$perl_hash_or_arrayref  = decode_json $utf8_encoded_json_text;
 
# OO-interface

%daymap = (
    'Sun' => 0,
    'Mon' => 1,
    'Tue' => 2,
    'Wed' => 3,
    'Thu' => 4,
    'Fri' => 5,
    'Sat' => 6
);

if ($fetch){
foreach $day (0..6){
#print "day $day\n";

$json_text = `/var/www/wordpress/wp-content/plugins/WPSpin-master/spinpapi/spquery -j getRegularShowsInfo When $day`; 
$json_text =~ s/Query took:[^\n]*\n//;
$json = JSON::XS->new->allow_nonref;

#print "$json_text\n";
$perl_hash_ref =  $json->decode( $json_text ) ;

$showinfo{$day}=$perl_hash_ref;

}

}else{#don't fetch, read cache
  open $sic, "<", "/var/www/scripts/spinitron-scripts/spininfo.cache";
   local $/;    # slurp mode
  %showinfo = %{ eval(<$sic>)};
}

if ($fetch){
print Dumper(\%showinfo); 
exit;
}

#read showdb.txt
open $sdb, "<", "/var/www/scripts/showdb.txt";
while (<$sdb>){

($showid,$dow,$otietag)= /(\d+)-(\d+)\s+(\w+)/;
#print "[$showid] [$dow] [$otietag]\n";
$otie{$showid}{$dow}=$otietag;
}
#exit;

foreach $day (0..6){

@arr = @{ $showinfo{$day}{'results'}};

foreach $item (@arr){
#print Dumper($item);
#next;
if(0){
print $item->{'ShowName'};
print "\n";
print $item->{'ShowID'};
print "\n";
print $item->{'OnairTime'};
print "\n";
print $item->{'OffairTime'};
print "\n";
}
#print Dumper($item->{'Weekdays'});
foreach $dow (@{$item->{'Weekdays'}}){

$schedmap{$item->{'OnairTime'}}{$daymap{$dow}}={
  'ShowName' => $item->{'ShowName'},
  'ShowID' => $item->{'ShowID'},
  'OnairTime' => $item->{'OnairTime'},
  'OffairTime' => $item->{'OffairTime'},
  'Scheduled' => $item->{'Scheduled'}
};

#print "[$dow][$daymap{$dow}]\n";
#print "- - - -\n";
}
#$weekarr[$daymap
#print "\n";
#print $item->{'Scheduled'};
#print "NOT SCHEDULED\n" if (! $item->{'Scheduled'});
#print "\n";
#print "================\n";

}



}

foreach $day (0..6){
  foreach $hr ("00".."24"){
    foreach $min("00","30"){
	$time = "$hr:$min:00";
      if ($schedmap{$time}{$day}{'OnairTime'}){
undef %hash;
      %hash=();
        $schedmap{$time}{$day}{'OtieTag'} = $otie{$schedmap{$time}{$day}{'ShowID'}}{$day};
        %hash=%{$schedmap{$time}{$day}};
if(0){
      print "day: $day $hr:$min:00\n";
print "  ShowName: ".$schedmap{"$hr:$min:00"}{$day}{'ShowName'}."\n";
print "  ShowID: ".$schedmap{"$hr:$min:00"}{$day}{'ShowID'}."\n";
print "  OtieTag: ".$schedmap{"$hr:$min:00"}{$day}{'OtieTag'}."\n";
print "  OnairTime: ".$schedmap{"$hr:$min:00"}{$day}{'OnairTime'}."\n";
print "  OffairTime: ".$schedmap{"$hr:$min:00"}{$day}{'OffairTime'}."\n";
}
       }else{
#print Dumper("sav",\%hash);
  %{$schedmap{$time}{$day}}=%hash;
       }
    }
  }
}

 
      print Dumper(\%schedmap);
#$json_text   = $json->encode( $perl_scalar );
#$perl_scalar = $json->decode( $json_text );

#print "$perl_scalar\n";
 
#$pretty_printed = $json->pretty->encode( $perl_scalar ); # pretty-printing

#print "$pretty_printed\n";

