class ChangeStatusFromAnswers < ActiveRecord::Migration
  def change
    change_column_default :answers, :status, default: false
  end
end
