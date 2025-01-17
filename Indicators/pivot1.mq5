// تعریف متغیرها
double zigzagBuffer[];  // آرایه‌ای برای نگهداری مقادیر اندیکاتور
int lastHighIndex = -1, lastLowIndex = -1;  // ایندکس‌های آخرین High و Low
double lastHigh = 0.0, lastLow = 0.0;      // مقادیر آخرین High و Low

// تابع برای دریافت مقادیر ZigZag
void GetLastZigZagHighLow()
{
   // محاسبه اندیکاتور ZigZag
   if (CopyBuffer(iCustom(Symbol(), PERIOD_CURRENT, "ZigZag", 12, 5, 3), 0, 0, 100, zigzagBuffer) > 0)
   {
// It looks like you're interested in MQL5, which is a programming language used for developing trading robots, scripts, and technical market indicators for the MetaTrader 5 platform. If you have specific questions or need examples of MQL5 code, feel free to ask! Whether you're looking for help with a particular function, need guidance on creating a trading strategy, or want to understand how to use certain features, I'm here to assist.
// 

      // جستجوی آخرین نقاط High و Low
      for (int i = ArraySize(zigzagBuffer) - 1; i >= 0; i--)
      {
         if (zigzagBuffer[i] != 0)
         {
            if (lastHigh == 0.0 && iHigh(_Symbol,PERIOD_CURRENT,0)[i] == zigzagBuffer[i]) // پیدا کردن High
            {
               lastHigh = zigzagBuffer[i];
               lastHighIndex = i;
            }
            else if (lastLow == 0.0 && iLow(_Symbol,PERIOD_CURRENT,0)[i] == zigzagBuffer[i]) // پیدا کردن Low
            {
               lastLow = zigzagBuffer[i];
               lastLowIndex = i;
            }
         }
         if (lastHigh != 0.0 && lastLow != 0.0) break; // اگر هر دو پیدا شدند، خارج شو
      }
   }
}

// بدنه اصلی برنامه
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   // دریافت نقاط ZigZag
   GetLastZigZagHighLow();
   
   // پرینت مقادیر برای بررسی
   Print("Last High: ", lastHigh, " at index: ", lastHighIndex);
   Print("Last Low: ", lastLow, " at index: ", lastLowIndex);

   return rates_total;
}
