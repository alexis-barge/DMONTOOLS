function [fig1]=plot_sea_ice(fig,filename,name,print_fig);
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% PLOTTING ROUTINE FOR SEA-ICE
%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Declarations
font=12;
	variable = { ...
	'Ice Volume (10^9 m^3)' ;...
	'Ice Area   (10^9 m^2)' ;...
	'Ice Extent (10^9 m^2)' ;...
	} ; 

	zone = { ...
	'Northern' ;...
	'Southern' ;...
	} ; 

	season = { ...
	'Fev';...
	'Mar';...
	'Aug';...
	'Sep';...
	} ; 

nhead = 1;   % 1 header line
%%%%% READ
X=load(filename) ; yrs=X(2:end,1) ; mnths=X(1,2:5) ; X=X(2:end,2:end); 
yr1 = X(nhead+1, 1 ) ;
yr2 = X(end, 1 ) ;

nyrs=length(yrs);

%%%%%%%% PLOTS
splt=length(zone)*length(variable) ;



%-----------------------------------------------
date=yrs*ones(1,4)+ones(nyrs,1)*mnths./12 ; [I J]=size(date);

splt1 = 2 ;
splt2 = 3 ;
figure(fig);clf;

ii=0;
	for i1 = 1:splt1
	for i2 = 1:splt2
	if i1*i2 <= splt
	ii=ii+1;
subplot(splt1,splt2,ii);hold on
XX=X(:,1+2*length(mnths)*(i2-1)+length(mnths)*(i1-1):4+2*length(mnths)*(i2-1)+length(mnths)*(i1-1));
plot(reshape(date',I*J,1),reshape(XX',I*J,1),'k-')
hold on;
p=plot(date,XX,'.');set(p,'MarkerSize',20);set(gca,'fontsize',font);grid;
AA=axis;axis tight;BB=axis;axis([BB(1) BB(2) 0 AA(4)])

tit=strcat(zone(i1), ' Ice ', variable(i2));
if i2==1 ; ylabel(zone(i1)    ,'fontsize',font) ; end
if i1==1 ; title (variable(i2),'fontsize',font) ; end
if i1==splt1 ; if i2==2 ; xlabel(name,'fontsize',14) ; end ; end
%if i2==splt2 ; if i1==splt1 ; l=legend(season,-1); set(l,'fontsize',14) ; end ; end
	end
	end
	end
	


                if print_fig == 1
                cmd=sprintf('%s  %s  %s%s ','print','-dpsc', name,'_sea_ice.ps') ;
                %orient landscape;eval(cmd)
                eval(cmd)
                cmd=sprintf('%s  %s  %s%s ','print','-djpeg100', name,'_sea_ice.jpg') ;
                %orient landscape;eval(cmd)
                eval(cmd)
                end


		
%-----------------------------------------------
fig1=fig+1;
if nargout==0,
 clear cs
end;