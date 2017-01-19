Page Scraper
=======

A simple app that looks for Twitter and Github profile links on a given website and prints them on a page for you to save time having to search for them.

Technologies Used:
-----------
- Ruby
- Rspec
- Capybara
- Sinatra
- GitHub
- Command Line
- Nokogiri

How to use
----------
Clone the repository:
```shell
$ git clone https://github.com/alexfakhri/page_scraper.git
```

Change into the directory:
```shell
$ cd page_scraper
```

Change into the directory:
```shell
$ bundle install
```

To test:
```shell
$ rspec
```

Fire up and use
```shell
$ rackup
in broswer open: http://localhost:9292
```

Enter a URL in the input field using in the following format: http://google.com/

Further Improvements:
------
- I would like to feature test the application, but I had issues with capybara making requests to given URL and scraping the data from it.
- The unit tests need to be changed to better test the methods for retrieving and parsing the data, at the moment they are tested against one given URL.
- Further error check the application, although it does catch errors for websites that don't work, it needs to be checked for other issues that may come up during use.
- Better use of regular expressions to ensure the URL put in meets the format required, or possibly change the input to the correct format to make it easier for the user to check websites.
- Better regular expressions to check that the Twitter and Github links found are actually links to their profiles and not links to other pages on Twitter and Github.
