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

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, obj: quote, ua: ua
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A piture is worth one k pixels",
      "attribution" => "Me"
    }

    m = FileModel.create attrs
    render :quote, obj: m
  end

  def find_by_submitter
    m = FileModel.method_missing("find_all_by_submitter", "Hexter")
    render :quote, obj: m.first
  end

  def update
    raise "Only POST to this route!" unless env["REQUEST_METHOD"] == "POST"

    body = env["rack.input"].read
    astr = body.split("&")
    params = {}

    astr.each do |a|
      name, val = a.split "="
      params[name] = val
    end

    quote = FileModel.find(params["id"].to_i)
    quote["submitter"] = params["submitter"]
    quote.save

    render :quote, obj: quote
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
