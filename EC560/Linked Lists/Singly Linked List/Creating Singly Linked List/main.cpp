#include <iostream>

using namespace std;

struct node
{
    int data;
    struct node *next;
};

int main()
{
    node *head, *newNode, *temp;
    int wantToContinue, totalNodes = 0;
    head = 0; // Initiallising Head Node to 0

    while (true)
    {
        newNode = new node; // Creating a new node

        cout << "Enter the data\n";
        cin >> newNode->data;
        newNode->next = 0;
        totalNodes++;

        if (head == 0)
        {
            head = newNode;
            temp = head;
        }
        else
        {
            temp->next = newNode;
            temp = newNode;
        }
        cout << "Do you want to Continue?\nPress '0' for NO any other character is considered as 'YES': ";
        cin >> wantToContinue;
        if (!wantToContinue){
            break;
        }
    }
    cout << "Total Number of Nodes are: " << totalNodes;

    return 0;
}
