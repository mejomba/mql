// ===============================================
// ################### OnInit ####################
// ===============================================
int OnInit()
  {
  int StocHandel = iStochastic(Symbol(), PERIOD_CURRENT, 5, 3, 3, MODE_SMA, STO_CLOSECLOSE);
  // تنظیم بافرها
   SetIndexBuffer(0, StochasticMain);
   SetIndexBuffer(1, StochasticSignal);
  // تنظیم محاس
  int subwindow=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);
   ChartIndicatorAdd(0, subwindow, StocHandel);

   // مقداردهی به اندیکاتور
   ArraySetAsSeries(StochasticMain, true);
   ArraySetAsSeries(StochasticSignal, true);
   

   
   ZigZagHandle = iCustom(_Symbol, PERIOD_CURRENT, "Examples/ZigZag", 5, 3, 3);
      
      
   //--- if the handle is not created
   if(ZigZagHandle==INVALID_HANDLE)
     {
      Print("Error creating \"zigzag\" indicator");
      ExpertRemove();
     }
   
   
   return(INIT_SUCCEEDED);
  } // end OnInit
// ===============================================
// ################## OnDeInit ###################
// ===============================================  
 void OnDeinit(const int reason)
  {
   
  } // end OnDeinit
// ===============================================
// ################### OnTick ####################
// ===============================================
void OnTick()
  {

   if (CopyBuffer(ZigZagHandle,0,0,ZigZagBufferSize,ZigZagBuffer) != ZigZagBufferSize)
      return;
      
   ArrayReverse(ZigZagBuffer);
   ZigZagHighLow(ZigZagBuffer);

   //for(int i=0; i<ArraySize(ZigZagBuffer); i++){
     // Print("OnTick ZigZagHighLow: ", ZigZagBuffer[0], "  ", ZigZagBuffer[1], " ", ZigZagBuffer[2]);
   //}
   Print("ZigZagBuffer: ", ZigZagBuffer[0], " ", ZigZagBuffer[1], " ", ZigZagBuffer[2]);
   DrawFibonacciLevels(ZigZagBuffer[2], ZigZagBuffer[1]);
   
  } // end OnTick
// ===============================================
// ===============================================