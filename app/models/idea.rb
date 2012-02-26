class Idea < ActiveRecord::Base

  hobo_model # Don't put anything above this

	fields do
		content :text, :required
		user_id :integer, :required

		timestamps
	end

	belongs_to :user, :creator => true

	def name
		return "\##{id}"
	end

  # --- Permissions --- #

	def create_permitted?
		acting_user.administrator? ||
			user_is?(acting_user)
	end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
