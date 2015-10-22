class Note < ActiveRecord::Base
  validates :user_id, :track_id, :note, presence: true
  validate :user_exists?
  validate :track_exists?

  belongs_to :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :track,
    class_name: 'Track',
    foreign_key: :track_id,
    primary_key: :id

  def user_exists?
    user = User.find(user_id)
    if user.nil?
      errors[:note] << "Not a valid user."
    end
  end

  def track_exists?
    track = Track.find(track_id)
    if track.nil?
      errors[:note] << "Not a valid track."
    end
  end

end
