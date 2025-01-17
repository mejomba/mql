#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// ====================================
// include
// ====================================
#include <Trade/trade.mqh>
#include <base/Base.mqh>


// ====================================
// input
// ====================================
input int ZigZagBufferSize = 100;
input int ZigZag_Depth = 12;
input int ZigZag_Deviation = 5;
input int ZigZag_back_step = 3;


// ====================================
// global variable
// ====================================
double ZigZagBuffer[];
int ZigZagHandle;
double fib_ret_levels[4];
double fib_ret_32_value;
double fib_ret_50_value;
double fib_ret_61_value;
double fib_ret_78_value;

double fib_ext_61_value;
double fib_ext_100_value;
double fib_ext_127_value;
double fib_ext_168_value;

double z0;
double z1;
double z2;
// ====================================


// ====================================
// class instance
// ====================================
Base base;
CTrade TRADE;


// ====================================
// OnInit
// ====================================
int OnInit()
  {
  
  int StocHandel = iStochastic(Symbol(), PERIOD_CURRENT, 5, 3, 3, MODE_SMA, STO_CLOSECLOSE);
   
   ZigZagHandle = iCustom(_Symbol, PERIOD_CURRENT, "Examples/ZigZag", ZigZag_Depth, ZigZag_Deviation, ZigZag_back_step);
      
   //--- if the handle is not created
   if(ZigZagHandle==INVALID_HANDLE)
     {
      Print("Error creating \"zigzag\" indicator");
      ExpertRemove();
     }
   
   
   return(INIT_SUCCEEDED);
  } // end OnInit
  

// ====================================
// OnDeInit
// ====================================
void OnDeinit(const int reason)
  {
   
  } // end OnDeinit


// ====================================
// OnTick
// ====================================
void OnTick()
  {

   if (CopyBuffer(ZigZagHandle,0,0,ZigZagBufferSize,ZigZagBuffer) != ZigZagBufferSize)
      return;
   
   
   ArrayReverse(ZigZagBuffer);
   base.ZigZagHighLow(ZigZagBuffer);
   
   z0 = ZigZagBuffer[0];
   z1 = ZigZagBuffer[1];
   z2 = ZigZagBuffer[2];

   Print("ZigZagBuffer: ", ZigZagBuffer[0], " ", ZigZagBuffer[1], " ", ZigZagBuffer[2]);
   base.DrawFibonacciLevels(z2, z1);
   
   // ===== calculate fib_ret and assight to local variable
   base.Calc_Fib_Retracement_Levels(fib_ret_levels,z2, z1);
   fib_ret_32_value = fib_ret_levels[0];
   fib_ret_50_value = fib_ret_levels[1];
   fib_ret_61_value = fib_ret_levels[2];
   fib_ret_78_value = fib_ret_levels[3];
   
  } // end OnTick
