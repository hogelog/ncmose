class NovelsController < ApplicationController
  permits :ncode

  def show(id)
    @novel = Novel.find(id)
  end

  def create(novel)
    @novel = Novel.create!(regularize_novel(novel))
    redirect_to @novel
  end

  def destroy(id)
    @novel = Novel.find(id)
    novel.destroy!
    redirect_to root_path
  end

  private

  def regularize_novel(src_novel)
    novel = src_novel.reverse_merge(title: "unknown")
    novel[:ncode] = $1 if src_novel[:ncode] =~ %r(http://ncode.syosetu.com/(\w+)(?:/?|$))
    novel
  end
end
