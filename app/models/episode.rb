class Episode < ApplicationRecord
  include EpisodeBase

  belongs_to :novel

  scope :synthesized, -> { where(synthesized: true) }
  scope :unsynthesized, -> { where(synthesized: false) }

  delegate :ncode, to: :novel

  def archive!
    transaction do
      ArchivedEpisode.create!(
        ncode: ncode,
        number: number,
        title: title,
      )
      destroy!
    end
  end
end
