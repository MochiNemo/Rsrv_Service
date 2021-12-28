class Rsrv < ApplicationRecord

  validates :start_date,    presence: true
  validates :end_date,      presence: true
  validates :person_num,    presence: true

  validate :start_check
  validate :start_end_check
  validate :person_num_check
  
  def start_check
    if self.start_date != nil
      errors.add(:start_date, "は現在のより遅い日時を選択してください") if (self.start_date + 1.days)< Date.today
    end
  end
  
  def start_end_check
    if self.start_date != nil && self.end_date != nil
      errors.add(:end_date, 'は開始日より遅い日時を選択してください') if self.start_date >= self.end_date
    end
  end
  
  def person_num_check
    if self.person_num != nil
      errors.add(:person_num, '人数は1人以上で入力してください') if self.person_num < 1
    end
  end
  


  belongs_to :user
  belongs_to :room
end
