class Train < ActiveRecord::Base

  validates_uniqueness_of :train_line, scope: [:route_name,:run_number,:operator_id]

end
