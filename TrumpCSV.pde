
// Pull the csv file with all Trump tweets from July 2017
// Tweets available at http://www.trumptwitterarchive.com/archive
// Store all tweets in a String.
// Store one randomly chosen tweet in a String

class TrumpCSV {
  
// variables
  Table table1;
  ArrayList<String> text2 = new ArrayList();
  int count = 0;
  
  TrumpCSV () {
    table1 = loadTable("TrumpTweets3.csv", "header");
    println(table1.getRowCount() + " total rows in table");
    for (TableRow row : table1.rows()) {      
      String text1 = row.getString("text");
      text2.add(text1);
    }
    String[] allTweets = text2.toArray(new String[0]);
    saveStrings("allTweets.txt", allTweets);
    
    String[] randomTweet = new String[1];
    randomTweet[0] = allTweets[int(random(1, 220))];
    saveStrings("randomTweet.txt", randomTweet);
  }
}