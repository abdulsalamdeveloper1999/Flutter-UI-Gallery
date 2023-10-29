//convert DateTime object to a string yymmdd
String convertDateTimeToString(DateTime dateTime) {
// year in the format -> yyyy
  String year = dateTime.year.toString();

  // month in the format -> mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    return '0$month';
  }

// date or day in the format -> dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    return '0$day';
  }

  //final format-=yymmdd
  String yymmdd = year + month + day;

  return yymmdd;
}


/*


DateTime.now() -> 2023/2/11/
*/
