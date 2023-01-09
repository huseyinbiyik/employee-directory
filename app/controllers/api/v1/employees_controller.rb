module Api
  module V1
    class EmployeesController < ApplicationController
      def index
        response = HTTParty.get('https://reqres.in/api/users')
        response_body = response.body
        parsed_response = JSON.parse(response_body)
        Employee.delete_all
        parsed_response['data'].each do |e|
          Employee.create(
            employee_id: e['id'],
            first_name: e['first_name'],
            last_name: e['last_name'],
            email: e['email'],
            avatar: e['avatar']
          )
        end
        @employees = Employee.all
        render json: @employees
      end
    end
  end
end
