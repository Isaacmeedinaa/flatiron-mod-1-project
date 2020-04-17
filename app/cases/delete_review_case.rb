# The purpose of this method is to allow users to delete a selected review

def delete_review(this_review)
  prompt = TTY::Prompt.new
    # we ask users if they are sure to delete the review
    if prompt.yes?('Are you sure you want to delete this review? 🤔')
      Review.destroy(this_review.id)
      puts "Your review has been deleted!"
    else
      puts "No review was deleted."
    end
  # end
end