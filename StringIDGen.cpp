#include <string>
#include <vector>
#include <iostream>

int main() 
{
    /* INSERT STRUCT NAME AND STRING HERE */
    std::string ToConvert("Hello World");
    std::string StructID("Prop");

    std::cout << StructID << ".StringSize = " << ToConvert.size() << ";\n";
    
    for(int i = 0; i < ToConvert.size(); i++)
    {
        char Char = ToConvert[i];
        int Delta = int(toupper(Char)) - int('A');
        int DeltaFromP = (Delta / 15) * (Delta + 145);
        int DeltaFromA = (1 - (Delta / 15)) * (Delta + 177);
        
        int CharID = DeltaFromA + DeltaFromP;
        CharID -= islower(Char) ? 32 : 0;
        CharID = isspace(Char) ? 80 : CharID;
        
        std::cout << StructID << ".String[" << i << "] = " << CharID << ";\n";
    }
    
    return 0;
}