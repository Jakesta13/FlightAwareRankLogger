<?php
// Get first Argument (Base64 version of JSON data for easy transporting) then convert it.
if (isset($argv['1'])){
$decoded = (base64_decode($argv['1']));
$output = (json_decode($decoded,True));
};
// Get second Argument which should be your FlightAware ADS-B Site ID for the feeder you are getting the ranking for.
if (isset($argv['2'])){
$siteID = $argv['2'];
};
// Calculating how long ago the feeder checked in (Get current time in epoch, then minus the last Checked-in time to get duration in seconds).
$epoch = time();
$sinceCheckIn = $epoch - $output['sites'][$siteID]['last_checkin'];

// Output retrieved Rank and last Checked-in for bash script to injest.
echo $output['sites'][$siteID]['current_ranking']." ". $sinceCheckIn
?>
