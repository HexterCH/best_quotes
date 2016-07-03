class QuotesController < Rulers::Controller
  def a_quote
    "There is nothing either good or bad" + "but thinking makes it so" +
      "\n<pre>\n#{env}\n</pre>"
  end

  def test_page
    "Test the rerun gem work or not ?"
  end

  def exception
    raise "It's a bad name"
  end
end
