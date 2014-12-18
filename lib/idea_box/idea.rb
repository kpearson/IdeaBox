class Idea
  include Comparable
  attr_reader :id, :title, :description, :rank

  def initialize(attributes)
    @id          = attributes["id"]
    @title       = attributes["title"]
    @description = attributes["description"]
    @rank        = attributes["rank"] || 0
  end

  def save
    IdeaStore.create(to_h)
  end

  def to_h
    {
      "id" => id || new_id,
      "title" => title,
      "description" => description,
      "rank" => rank
    }
  end

  def new_id
    IdeaStore.all.last == nil ? 1 : IdeaStore.all.last.id.to_i + 1
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end
end
