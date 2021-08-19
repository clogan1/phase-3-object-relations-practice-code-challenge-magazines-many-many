class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map(&:email).join(';')
    end

    def self.most_popular
        max_subs = self.all.map {|mag| mag.subscriptions.count}.max
        self.all.filter {|mag| mag.subscriptions.count == max_subs}.map {|mag| mag.title}
    end
end