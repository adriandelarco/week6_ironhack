class Task < ActiveRecord::Base
	belongs_to :user
	scope :completed_tasks, -> { where(completed: true) }
	scope :pending_tasks, -> { where(completed: false) }

	def as_json(options={})
		super(except: [:id, :created_at, :updated_at])
	end

	def complete!
		self.completed = true
		self.save
		self
	end
end
