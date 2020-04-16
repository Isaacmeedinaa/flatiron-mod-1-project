# this method is a utility to produce a formated list for use in a emnum select
# it takes in a list and the column needs to be extracted into the TTY response
def get_enum_list(some_list, column, fav=nil)
  num_list = []
  some_list.each_with_index do |value, index|
      liste = []
      mark = value[column]
      if fav
        if index == fav
          mark = mark + " 👍"
        end
      end
      liste << mark
      liste << index + 1
      num_list << liste
  end
  num_list
end