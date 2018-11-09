#include <iostream>
#include <cstdio>
#include <regex>
#include <string>

#include "tinyxml2.h"

using namespace tinyxml2;
using namespace std;

double getHP(const char* str) {
    try {
        regex re("h", std::regex_constants::ECMAScript | std::regex_constants::icase);
        cmatch m;
        if(regex_match("hej 7,6 då", m, re)) {
            cout << m[0] << endl;
        } else {
            cout << "no match" << endl;
        }
    } catch (const std::regex_error& e) {
        cout << "re error: " << e.what() << endl;
    }

    return 0;
}

int main() {
    XMLDocument doc;
    doc.LoadFile("grades.xml");

    int number_of_grades = 0;
    int grades[] = {0,0,0,0,0,0,0};
    /**
     *   A = 5
     *   B = 4.5
     * ...
     */
    double grade_score = 0; 

    /*
        Start at the tag <ladok-avslutade-kurser>

    */
    XMLElement* div = doc.FirstChildElement(); //ladok-avslutade-kurser
    div = div->FirstChildElement(); // div
    div = div->FirstChildElement()->NextSiblingElement(); // div -> div col-lg-8
    div = div->FirstChildElement()->NextSiblingElement(); // div separator -> ladok-avslutade-kurser-i-struktur
    XMLElement* element = div->FirstChildElement()->FirstChildElement()->NextSiblingElement();
    for (element; element; element=element->NextSiblingElement()) {
        XMLElement* course = element;//"ladok-avslutad-kurs");
        course = course->FirstChildElement()->FirstChildElement(); // div -> div
        course = course->FirstChildElement();//"h4");

        // Get hp
        XMLElement* courseName = course;
        courseName = courseName->FirstChildElement(); //ladok-kurslink
        courseName = courseName->FirstChildElement(); //div idk-visa-mobil
        courseName = courseName->FirstChildElement(); //a
        printf("%s\n", courseName->GetText());
        double hp = getHP(courseName->GetText());


        // Get grade
        course = course->NextSiblingElement();//"p");
        course = course->FirstChildElement();//"string");
        char grade = course->GetText()[7];
        printf("course: %c\n", grade);
        switch(grade) {
            case 'A':
                grades[6]++;
                number_of_grades++;
                break;
            case 'B':
                grades[5]++;
                number_of_grades++;
                break;
            case 'C':
                grades[4]++;
                number_of_grades++;
                break;
            case 'D':
                grades[3]++;
                number_of_grades++;
                break;
            case 'E':
                grades[2]++;
                number_of_grades++;
                break;
            case 'P':
                break;
        }
    }

    grade_score = grades[6]*5 + grades[5]*4.5 + grades[4]*4 + grades[3]*3.5 + grades[2]*3;
    printf("Grade summary:\n");
    printf("A(5): %d\n", grades[6]);
    printf("B(4): %d\n", grades[5]);
    printf("C(3): %d\n", grades[4]);
    printf("D(2): %d\n", grades[3]);
    printf("E(1): %d\n", grades[2]);
    printf("\n");
    printf("Total grade score: %f\n", grade_score);
    printf("Number of grade: %d\n", number_of_grades);
    printf("Average grade score: %f\n", grade_score/(double)number_of_grades);

    return 0;
}
