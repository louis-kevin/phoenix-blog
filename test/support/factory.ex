defmodule Blog.Factory do
  alias Blog.Repo
  alias Blog.Posts.Post
  alias Blog.Comments.Comment
  # Factories

  def build(:post) do
    %Post{title: "hello world"}
  end

  def build(:comment) do
    %Comment{name: "Kevin", content: "Hello"}
  end

  def build(:post_with_comments) do
    %Post{
      title: "hello with comments",
      comments: [
        build(:comment, body: "first"),
        build(:comment, body: "second")
      ]
    }
  end

  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
