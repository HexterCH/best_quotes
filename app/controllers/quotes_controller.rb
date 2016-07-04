class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, noun: :winking
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, obj: quote_1
  end

  def test_page
    "Test the rerun gem work or not ?"
  end

  def exception
    raise "It's a bad name"
  end

  def test_rendering
    @noun = "A BlendTec blendar"
    @another_noun = "a mutton, lettuce and " + "tomato sandwich"
    render :test_rendering
  end
end
