   M S B A M L   `   `   `  ����J  FVendingMachines, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:VendingMachines.pagesVendingMachines.pages  5      "    VendingMachines.pages.Otchet   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      5local#clr-namespace:VendingMachines.pages     5        N� Title$  Otchet��5	      .��5      � 
������� � ColumnDefinitions 5   
   �� 5      $��50 �6   �� 5      $
��635* �6   �� 5      $��50 �6    � RowDefinitions 5   
   �� 5      $	��100 �6   �� 5      $
��269* �6   �� 5      $��75 �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ 
reportGrid��5   g   $��1��6   $��Center=�6#   $��1��6A   $	��Top=�6N      AutoGenerateColumns .     Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6S   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *Drinks.Name+6_     5      $
 Cost��6%   $ * 6S    63   �� *Drinks.Cost+6_     5      $ Count after last update��6%   $ * 6f    6F   �� *AfterUpdate+6r     5      $ Profit��6%   $ * 6P    65   �� *Profit+6]   5      �� 5   
   -   5        	 ��Name$	 actuallyData��5   i   $
��Data��6   $��1��6   $��Center=�61   $��Center=�6L   $��18(�6   $
��Bold"�6�   $��325,50,325,10q�6�   �� 5   
   -   5        
 ��Name$
 savePdf��5   �   $��Сохранить��6   $��1��6%   $��Center=�65   $��2��6R   $��Center=�6_   $��75��6z   6�   5!      5"      