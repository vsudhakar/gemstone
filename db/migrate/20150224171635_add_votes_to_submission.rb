class AddVotesToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :votes, :string
  end
end
