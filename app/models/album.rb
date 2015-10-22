class Album < ActiveRecord::Base
  validates :title, :band_id, presence: true
  validates :live_or_studio, inclusion: { in: %w(Live Studio), message: "%{value} is not a correct type"}
  validate :band_exists?

  belongs_to :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id

  has_many :tracks,
    dependent: :destroy,
    class_name: 'Track',
    foreign_key: :album_id,
    primary_key: :id

  def band_exists?
    band = Band.find(band_id)
    if band.nil?
      errors[:album] << "Not a valid band."
    end
  end

end
