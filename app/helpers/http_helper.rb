module HttpHelper
  def self.get_employee_list(page)
    response = HTTParty.get("https://reqres.in/api/users?page=#{page}")
    response.body
  end

  def self.get_employee(id)
    response = HTTParty.get("https://reqres.in/api/users/#{id}")
    response.body
  end

  def self.search_employees
    response = HTTParty.get('https://reqres.in/api/users?per_page=12')
    response.body
  end
end
