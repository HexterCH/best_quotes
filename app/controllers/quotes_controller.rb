class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, noun: :winking
  end

  def test_page
    "Test the rerun gem work or not ?"
  end

  def exception
    raise "It's a bad name"
  end
end
