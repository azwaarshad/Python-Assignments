#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>

using namespace std;
void AddBookings();
void DisplayBookings();
void SearchBookings();

struct HotelBooking{
    string customerName;
    string checkInDate;
    string checkOutDate;
    int roomNumber;
};

int main(){
    int choice;

    while (true){
        cout<<"---------Hotel Booking Management System----------" << endl;
        cout<<"1. Add Booking" << endl;
        cout<<"2. Display Bookings" << endl;
        cout<<"3. Search Booking" << endl;
        cout<<"4. Exit"<<endl;
        cout<<"Enter your choice: ";
        cin>>choice;
        cin.ignore();

        switch (choice){
            case 1:
                AddBookings();
                break;
            case 2:
                DisplayBookings();
                break;
            case 3:
                SearchBookings();
                break;
            case 4:
                return 0;
            default:
                cout<<"Invalid choice! Please try again."<<endl;
        }

        cout<<endl;
    }

    return 0;
}

void AddBookings(){
    HotelBooking booking;
    cout << "Enter Customer Name: ";
    getline(cin, booking.customerName);
    cout << "Enter Check-in Date: ";
    getline(cin, booking.checkInDate);
    cout << "Enter Check-out Date: ";
    getline(cin, booking.checkOutDate);
    cout << "Enter Room Number: ";
    cin >> booking.roomNumber;
    

    ofstream outFile("Hotel Bookings.txt", ios::app);
    if (!outFile){
        cerr<<"Failed to open file for writing!"<<endl;
        return;
    }

    outFile<<booking.customerName<<endl;
    outFile<<booking.checkInDate<<endl;
    outFile<<booking.checkOutDate<<endl;
    outFile<<booking.roomNumber<<endl;

    outFile.close();

    cout<<"Booking added successfully."<<endl;
}

void DisplayBookings(){
    ifstream inFile("Hotel Bookings.txt");
    if (!inFile){
        cerr<<"Failed to open file for reading!"<<endl;
        return;
    }

    HotelBooking booking;
    int count = 0;
    while (getline(inFile, booking.customerName)){
        getline(inFile, booking.checkInDate);
        getline(inFile, booking.checkOutDate);
        inFile >> booking.roomNumber;
        inFile.ignore();

        cout<<"Booking " << ++count << ":"<<endl;
        cout<<"Customer Name: " << booking.customerName<<endl;
        cout<<"Check-in Date: " << booking.checkInDate<<endl;
        cout<<"Check-out Date: " << booking.checkOutDate<<endl;
        cout<<"Room Number: " << booking.roomNumber<<endl;
        cout<<endl;
    }

    inFile.close();

    if (count == 0){
        cout<<"No bookings found!"<<endl;
    }
}

void SearchBookings(){

    string searchName;
    cout<<"Enter Customer Name to search: ";
    getline(cin >> ws, searchName);

    ifstream inFile("Hotel Bookings.txt");
    if (!inFile){
        cerr<<"Failed to open file for reading!"<<endl;
        return;
    }

    HotelBooking booking;
    int count = 0;
    bool found = false;
    while (getline(inFile, booking.customerName)){
        getline(inFile, booking.checkInDate);
        getline(inFile, booking.checkOutDate);
        inFile >> booking.roomNumber;
        inFile.ignore();

        if (booking.customerName == searchName){
            found = true;
            cout<<"Booking " << ++count << ":"<<endl;
            cout<<"Customer Name: " << booking.customerName<<endl;
            cout<<"Check-in Date: " << booking.checkInDate<<endl;
            cout<<"Check-out Date: " << booking.checkOutDate<<endl;
            cout<<"Room Number: " << booking.roomNumber<<endl;
            cout<<endl;
        }
    }

    inFile.close();

    if (!found){
        cout << "No bookings found for customer '" << searchName << "'." << endl;
    }
}
