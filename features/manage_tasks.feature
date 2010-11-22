Feature: Managing task
	As registered user
	In order to better organizing my time
	I want to manage my tasks

	Background:
		Given I am a new, authenticated user


	Scenario: Getting create form
		Given I am on the tasks page
		When I follow "Nowe zadanie"
		Then I should be on the new_task page

	Scenario: Creating new task
		Given I am on the new_task page
		When I fill in the following:
			| Nazwa     	   | Pierwsze zadanie 		  |
			| Opis      	   | Opis pierwszego zadania  |
			| Postęp    	   | 1						  |
			| Czas zakończenia | 2010-12-24				  |
		And I choose "task_priority_1"
		And I press "przeslij"
		And I go to the tasks page
		Then I should see "Pierwsze zadanie"
	
	Scenario: Editing existing task
		Given I created new task "Pierwsze zadanie" described "Opis pierwszego zadania"
		When I go to the tasks page
		And I follow "Edytuj"
		And I fill in the following:
			| Nazwa     	   | Wyedtyowane zadanie 	  	|
			| Opis      	   | Opis wyedytowanego zadania |
			| Postęp    	   | 1						  	|
			| Czas zakończenia | 2010-12-24				  	|
		And I choose "task_priority_1"
		And I press "przeslij"
		And I go to the tasks page
		Then I should see "Wyedtyowane zadanie"
		And I should see "Ilość zadań: 1"
	
	Scenario: Deleting existing task
		Given I created new task "Pierwsze zadanie" described "Opis pierwszego zadania"
		When I go to the tasks page
		And I follow "Usuń"
		And I go to the tasks page
		Then I am not finished here
		

			



