# this method is a utility to produce a formated list for use in a emnum select
# it takes in a list and the column needs to be extracted into the TTY response
def get_enum_list(some_list, column)
  num_list = []
  some_list.each_with_index do |value, index|
      liste = []
      liste << value[column]
      liste << index + 1
      num_list << liste
  end
  num_list
end