module Api
  module V1
    class EmployeesController < ApplicationController
      def index
        response = HTTParty.get("https://reqres.in/api/users?page=#{params[:page]}")
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
        render json: { status: 200, data: @employees, total_pages: parsed_response['total_pages'] }
      end

      def show
        response = HTTParty.get("https://reqres.in/api/users/#{params[:id]}")
        response_body = response.body
        parsed_response = JSON.parse(response_body)
        Employee.delete_all
        parsed_response = parsed_response['data']
        @employee = Employee.create(
          employee_id: parsed_response['id'],
          first_name: parsed_response['first_name'],
          last_name: parsed_response['last_name'],
          email: parsed_response['email'],
          avatar: parsed_response['avatar']
        )

        render json: { status: 200, employee: @employee }
      end

      def search
        response = HTTParty.get('https://reqres.in/api/users?per_page=12')
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
        @employees = Employee.where('email LIKE ?', "%#{params[:email]}%")
        render json: { status: 200, data: @employees }
      end
    end
  end
end
