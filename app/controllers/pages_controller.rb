class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # hightlights moments.
    # mycontacts
    # myoccasions
    # occasions

    return unless current_user
    # looking for events i created
    @myoccasions = current_user.myoccasions


    # looking for product i choose for an existing event.
    occasions = current_user.occasions

    # old code
    @mycontacts = current_user.mycontact.contacts.map { |c| User.find(c) }
    # @mycontacts = current_user.mycontact.contacts.map { |c| User.find(c) }
    if current_user.mycontact
      @mycontacts = current_user.mycontact.contacts.map { |c| User.find(c) }
    else
      @mycontacts = []
    end
    @mycontacts.sort_by! { |p| p.personnal.birthday }
  end
end
