import bb.cascades 1.4


    Container {
       id: root 
       
       //////////////////////////////////////////////////////////////
       //
       // PROPERTIES
       
       property int employeeNumber
       property string surname
       property string firstname
       property string login
       property string email
       property string jobTitle
       property alias picture: employeeImage.imageSource
       
       //////////////////////////////////////////////////////////////
       //
       // SIGNALS
       
       signal salaryChanged(double newSalary) 
       
       
       //////////////////////////////////////////////////////////////
       //
       // METHODS 
       
       
       function getLogin() {
           return root.firstname.charAt(0).toLowerCase() + root.surname.toLowerCase();
           
       }
       
       function getEmail() {
           return root.firstname.toLowerCase() + "." + root.surname.toLowerCase() + "@myconpany.com";
       }
       
       onCreationCompleted: {
           switch (jobTitle) {
               case "Software Engineer":
                   jobs.selectedIndex = 1;
                   break;
               case "Manager":
                   jobs.selectedIndex = 2;
                   break;
               case "Director":
                   jobs.selectedIndex = 3;
                   break;
               case "technician":
                   jobs.selectedIndex = 4;
                   break;
               default:
                   jobs.selectedIndex = 0;
                   break;
               
           }
       }
       
       //////////////////////////////////////////////////////////////
       //
       //PRESENTATION
       
       ImageView {
           id: employeeImage
           horizontalAlignment: HorizontalAlignment.Center
        
       }
       Label {
           text: "this is really cool"
       }
       Label {
           text: "My Company Employee Details"
           textStyle.base: SystemDefaults.TextStyles.TitleText
           horizontalAlignment: HorizontalAlignment.Center
       }
       
       Label {
           text: "Employee Number: " + employeeNumber;
       }
       
       Label {
           text: "Last Name: " + surname;
       }
       
       Label {
           text: "First Name: " + firstname;
       }
       
       Label {
           text: "Login: " + root.getLogin();
       }
       
       Label {
           text: "Email: " + root.getEmail();
       }
       
       DropDown {
           id: jobs
           title: "jobs"
           enabled: true
           
           onSelectedIndexChanged: {
               console.debug("SelectedIndex was changed to: " + selectedIndex);
               console.debug("Selected option is: " + selectedOption.text);
               root.jobTitle = selectedOption.text;
               switch (selectedOption.text) {
                   case "Software Engineer":
                       root.salaryChanged(90000);
                       break;
                   case "Manager":
                       root.salaryChanged(100000);
                       break;
                   case "Director":
                       root.salaryChanged(150000);
                       break;
                   case "Technician":
                       root.salaryChanged(160000);
                       break;
                   default:
                       root.salaryChanged(0.0);
                       break;
               }
           }
           Option {
               text: "unknown"
           }
           
           Option {
               text: "Software Engineer"
           }

           Option {
               text: "Manager"
           }
           
           Option {
               text: "Technician"
           }

        }
    }

