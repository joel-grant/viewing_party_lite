class MovieReviewAPI
  attr_reader :id, :author, :content

  def initialize(data)
    @review_id = data[:id]
    @author = data[:author]
    @content = data[:content]
  end
end
