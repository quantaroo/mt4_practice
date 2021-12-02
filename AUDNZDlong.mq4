#property strict

string BotName = "Auzkiwi Long Bot";
int Magic = 123465;
int MaxCloseSpreadPips = 4;
int MaxTrades = 1;
int TradeDelayTimeSeconds = (1 * 5 * 60 * 60);
datetime LastTradePlacedTimeStamp = 0;
bool ShortSetup = False;
bool CloseSetup = False;
int TimeFrame = 1;
datetime LastActiontime;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()

   {
   int a = 400;
   int b = 600;
   int c = 200;
   int d = 2000;
   int e = 3000;
   int f = 5000;
   int g = 6000;
   int h = 2000;
   double WPR = iWPR(NULL,TimeFrame,d,0);
   double WPR1 = iWPR(NULL,TimeFrame,d,4);
   double WPR2 = iWPR(NULL,TimeFrame,e,0);
   double WPR3 = iWPR(NULL,TimeFrame,e,4);
   //double ICHI = iIchimoku(NULL,TimeFrame,30,2200,40,MODE_KIJUNSEN,0);
   //double MA = iMA(NULL,TimeFrame,9,0,MODE_SMA,PRICE_CLOSE,0);
   double MACD1 = iMACD(NULL,TimeFrame,a,b,c,PRICE_CLOSE,0,0);
   double MACD1a = iMACD(NULL,TimeFrame,a,b,c,PRICE_CLOSE,0,5);
   double MACD1b = iMACD(NULL,TimeFrame,a,b,c,PRICE_CLOSE,0,15);
   double MACD2 = iMACD(NULL,TimeFrame,a,b,c,PRICE_CLOSE,1,0);
   double MACD2a = iMACD(NULL,TimeFrame,a,b,c,PRICE_CLOSE,1,5);
   double MACD2b = iMACD(NULL,TimeFrame,a,b,c,PRICE_CLOSE,1,15);
   double MACDbig = iMACD(NULL,TimeFrame,f,g,h,PRICE_CLOSE,0,0);
   //double ICHI1 = iIchimoku(NULL,TimeFrame,30,120,60,4,0);
   //double DMI = iCustom(NULL,TimeFrame,"DMI oscillator 1.1","15 Minutes",5,"Exponential moving average",3,"Exponential moving average","Change olor on levels cross",8.0,-8.0,false,false,false,false,false,false,false,0,0);
   //double DMI1 = iCustom(NULL,TimeFrame,"DMI oscillator 1.1","15 Minutes",5,"Exponential moving average",3,"Exponential moving average","Change olor on levels cross",8.0,-8.0,false,false,false,false,false,false,false,0,1);
   //double SSL1 = iCustom(NULL,TimeFrame,"ssl-channel-chart-alert-indicator",2,"false","false","false","false",0,0);
   //double SSL2 = iCustom(NULL,TimeFrame,"ssl-channel-chart-alert-indicator",2,"false","false","false","false",1,0);
   //double SSL1a = iCustom(NULL,TimeFrame,"ssl-channel-chart-alert-indicator",2,"false","false","false","false",0,1);
   //double SSL2a = iCustom(NULL,TimeFrame,"ssl-channel-chart-alert-indicator",2,"false","false","false","false",1,1);
   //double Strength1 = iCustom(NULL,TimeFrame,"absolute-strength-histogram", 0,60,2,4,0,3,3,2,0);
   //double Strength1a = iCustom(NULL,TimeFrame,"absolute-strength-histogram", 0,60,2,4,0,3,3,2,1);
   //double Strength2 = iCustom(NULL,TimeFrame,"absolute-strength-histogram", 0,60,2,4,0,3,3,3,0);
   //double Strength2a = iCustom(NULL,TimeFrame,"absolute-strength-histogram", 0,60,2,4,0,3,3,3,1);
   //double Aroon1 = iCustom(NULL,TimeFrame,"aroon",90,0,0);
   //double Aroon1a = iCustom(NULL,TimeFrame,"aroon",90,0,1);
   //double Aroon2 = iCustom(NULL,TimeFrame,"aroon",90,1,0);
   //double Aroon2a = iCustom(NULL,TimeFrame,"aroon",90,1,1);
   double MFI = iMFI(NULL,TimeFrame,40,0);
   //double OSMA = iOsMA(NULL,TimeFrame,75,125,125,PRICE_CLOSE,0);
   //double CCI = iCCI(NULL,TimeFrame,1200,PRICE_CLOSE,0);
   double ATR = (iATR(NULL,TimeFrame,28,0));
   double LotsToTrade = NormalizeDouble(((0.00000012)*AccountBalance()/(2*ATR)),2);
   double StopLoss = -(0.04*AccountBalance());
   double TakeProfit = (0.07*AccountBalance());
   //if((DMI1<0)&&(DMI>0)) CloseAllTrades();
   //if((Strength1a <= Strength2a)&&(Strength1 >= Strength2))CloseAllTrades();
   //if ((QQE1a <= QQE2a)&&(QQE1 >= QQE2)&&(QQE1b <= QQE2b)&&(QQE1c <= QQE2c))CloseAllTrades();
   //if ((SSL1a <= SSL2a)&&(SSL1 >= SSL2)) CloseAllTrades();
   //if ((Aroon1>=Aroon2)&&(Aroon1a<=Aroon2a))CloseAllTrades();Sleep(3600000);
   if(GetTotalProfits() > TakeProfit)CloseAllTrades();
   //if((MFI > 80))CloseAllTrades(); 
   //if((MFI < 23))CloseAllTrades();
   //if(CCI>-110)CloseAllTrades();
   //if(MA>ICHI)CloseAllTrades();
   if(GetTotalProfits()<StopLoss) CloseAllTrades();
   if(GetTotalOpenTrade() < MaxTrades)
     {
      //if((DMI1>=0) &&(WPR < -65))
      //if((Strength1a >= Strength2a)&&(WPR < -60))
      //if((SSL1a >= SSL2a)&&(WPR < -40))
      //if((QQE1a >= QQE2a)&&(QQE1b >= QQE2b)&&(QQE1c >= QQE2c)&&(WPR <= -55))
      if((MACD1>MACD2)&&(MACD1a<MACD2a)&&(MACD1b<MACD2b))
      //if(WPR > WPR1)
        {
         //if(DMI < 0)
         //if(Strength1 <= Strength2)
         //if ((QQE1 >= QQE2))
         //if (SSL1 <= SSL2)
         if((MACD1>0)&&(WPR > -30)&&(MACDbig > 0))
         //if((WPR > -30)&&(MACD1>0))
           {
            ShortSetup = True;
           }
        }
      if(ShortSetup == True)
        {
         
         int OrderResult = OrderSend(NULL, OP_BUY, LotsToTrade,Ask, 5,0,0, "BUY Order",Magic,0,clrGreen);
         ShortSetup = False;
    
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetTotalOpenTrade()
  {
   int TotalTrades = 0;

   for(int t=0; t < OrdersTotal(); t++)
     {
      if(OrderSelect(t, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() != Symbol())
            continue;
         if(OrderMagicNumber() != Magic)
            continue;
         if(OrderCloseTime() != 0)
            continue;

         TotalTrades = (TotalTrades +1);

        }
     }

   return TotalTrades;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseAllTrades()
  {
   int CloseResult = 0;

   for(int t=0; t < OrdersTotal(); t++)
     {
      if(OrderSelect(t,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() != Magic)
            continue;
         if(OrderSymbol() != Symbol())
            continue;
         if(OrderType() == OP_BUY)
            CloseResult = OrderClose(OrderTicket(),OrderLots(),Bid, MaxCloseSpreadPips, clrRed);
         if(OrderType() == OP_SELL)
            CloseResult = OrderClose(OrderTicket(),OrderLots(),Ask, MaxCloseSpreadPips, clrGreen);
         t--;
        }
     }

   return;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetTotalProfits()
  {
   double TotalProfits = 0.0;
   for(int t=0; t < OrdersTotal(); t++)
     {
      if(OrderSelect(t,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() != Magic)
            continue;
         if(OrderSymbol() != Symbol())
            continue;
         if(OrderCloseTime() != 0)
            continue;
         TotalProfits = (TotalProfits + OrderProfit());
        }
     }

   return TotalProfits;
  }
//+------------------------------------------------------------------+
