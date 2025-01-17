
class Base {
public:

   Base() {
      Print("Base created.");
   }

   void sendBuy() {
      Print("Buy");
   }

   void sendSel() {
      Print("Sel");
   }
   
   
   // =======================================================
   // تابع برای رسم زیگ زاگ
   // =======================================================
   void ZigZagHighLow(double &array[]){
      double x1 = 0;
      double x2 = 0;
      double x3 = 0;
      double temp = 0;
      for(int i=0; i<ArraySize(array); i++)
        {
           if(array[i] != 0 && x1 == 0)
             {
              x1 = array[i];
             } 
             else if (array[i] != 0 && x2 == 0) 
             {
               x2 = array[i];
             }
             else if (array[i] != 0 && x3 == 0)
             {
               x3 = array[i];
             }
        }
       
        array[0] = x1;
        array[1] = x2;
        array[2] = x3;
   } // End ZigZagHighLow
   
   
   // =======================================================
   // تابع برای محاسبه سطوح فیبوناچی ۲ نقطه
   // =======================================================
    void Calc_Fib_Retracement_Levels(double &levels[], double pivot1, double pivot2){
      double distance = pivot2 - pivot1;
      
      double fib_38_2 = pivot2 - 0.382 * distance;
      double fib_50_0 = pivot2 - 0.500 * distance;
      double fib_61_8 = pivot2 - 0.618 * distance;
      double fib_78_6 = pivot2 - 0.786 * distance;
      
      levels[0] = fib_38_2;
      levels[1] = fib_50_0;
      levels[2] = fib_61_8;
      levels[3] = fib_78_6;
   }
   
   
   // =======================================================
   // تابع برای محاسبه سطوح فیبوناچی سه نقطه ای
   // =======================================================
   void Calc_Fib_Ext_Levels(double &levels[], double pivot1, double pivot2){
      double distance = pivot2 - pivot1;
      
      double fib_ext_61 = pivot2 - 0.61 * distance;
      double fib_ext_100 = pivot2 - 1.00 * distance;
      double fib_ext_127 = pivot2 - 1.27 * distance;
      double fib_ext_168 = pivot2 - 1.68 * distance;
      
      levels[0] = fib_ext_61;
      levels[1] = fib_ext_100;
      levels[2] = fib_ext_127;
      levels[3] = fib_ext_168;
   }
   // =======================================================
   // تابع برای رسم فیبوناچی
   // =======================================================
   void DrawFibonacciLevels(double pivot1, double pivot2)
   {
      Print("DrawFibonacciLevels: ", pivot1, " ", pivot2);
      // حذف خطوط فیبوناچی قبلی
      ObjectDelete(0, "Fibonacci");
   
      // محاسبه سطوح فیبوناچی
      double distance = pivot2 - pivot1;
      Print("in fibo", pivot1, pivot2);
   
      //double fib_23_6 = pivot2 - 0.236 * distance;
      //double fib_38_2 = pivot2 - 0.382 * distance;
      //double fib_50_0 = pivot2 - 0.500 * distance;
      double fib_61_8 = pivot2 - 0.618 * distance;
      double fib_78_6 = pivot2 - 0.786 * distance;
   
      // رسم فیبوناچی
      int fib_obj = ObjectCreate(0, "Fibonacci", OBJ_FIBO, 0, iTime(_Symbol, PERIOD_CURRENT, 50), pivot1, iTime(_Symbol, PERIOD_CURRENT, 0), pivot2);
      ObjectSetInteger(0, "Fibonacci", OBJPROP_LEVELCOLOR, clrWhite);
      ObjectSetInteger(0, "Fibonacci", OBJPROP_LEVELS, 5);  // تعداد سطوح
   
      //ObjectSetDouble(0, "Fibonacci", OBJPROP_LEVELVALUE, fib_23_6);
      //ObjectSetDouble(0, "Fibonacci", OBJPROP_LEVELVALUE, fib_38_2);
      //ObjectSetDouble(0, "Fibonacci", OBJPROP_LEVELVALUE, fib_50_0);
      ObjectSetDouble(0, "Fibonacci", OBJPROP_LEVELVALUE, fib_61_8);
      ObjectSetDouble(0, "Fibonacci", OBJPROP_LEVELVALUE, fib_78_6);
   } // End DrawFibonacciLevels
   
   
   
   // =======================================================
   // return True if price between F1 and F2
   // =======================================================
   bool checkFiboSignal(double F1, double F2){
      Print("checkFiboSignal");
      return false;
   } // end checkFiboSignal
};
