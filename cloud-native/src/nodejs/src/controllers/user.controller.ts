import { IUser } from '../models/user.model';


 
async function GetUser(): Promise<IUser[]> {
    const users:IUser[] = [
        { email: 'john.smith@email.com', firstName: 'John',lastName:'Smith' },
        { email: 'david.jones@email.com', firstName: 'David',lastName:'Jones' },
        { email: 'michael.johnson@email.com', firstName: 'Michael',lastName:'Johnson' },
        { email: 'chris.lee@abc.com', firstName: 'Chris',lastName:'Lee'},
        { email: 'mike.brown@xyz.com', firstName: 'Mike',lastName:'Brown'}
     ];
    return users;    
  }
  export default {
    GetUser
  };
