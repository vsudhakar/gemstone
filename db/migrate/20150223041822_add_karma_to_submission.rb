class AddKarmaToSubmission < ActiveRecord::Migration
  def change
    #remove_column :submissions, :karma, :string
    add_column :submissions, :karma, :integer
  end
end
