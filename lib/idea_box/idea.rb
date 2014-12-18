class Idea
  include Comparable
  attr_reader :id, :title, :description, :rank, :created_at

  def initialize(attributes)
    @id          = attributes["id"] || IdeaStore.next_id
    @title       = attributes["title"]
    @description = attributes["description"]
    @rank        = attributes["rank"] || 0
    @created_at  = attributes["created_at"] || Time.now
  end

  def formatted_updated_at
    format_date(updated_at)
  end

  def formatted_created_at
    format_date(created_at)
  end

  def format_date(date)
    date.strftime("%b %e, %l:%M %p")
  end

  def save
    IdeaStore.create(to_h)
  end

  def to_h
    {
      "id"          => id,
      "title"       => title,
      "description" => description,
      "rank"        => rank,
      "created_at"  => created_at
    }
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end
end
