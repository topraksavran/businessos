async function refreshDashboardCashFlow(){
  if(typeof client==='undefined'||typeof state==='undefined'||typeof dashboardRange!=='function'||view!=='dashboard'||!state.tenantId||String(state.tenantId).startsWith('copy-'))return;
  const r=dashboardRange(),result=await client.rpc('get_dashboard_metrics',{target_workspace:state.tenantId,start_date:r.start,end_date:r.end});
  if(result.error||!result.data)return;
  const grid=document.querySelector('.grid'),cards=grid?.querySelectorAll(':scope > .card');if(!cards||cards.length<4)return;
  const cashCard=cards[2],resultCard=cards[3];if(cashCard.querySelector('.label')?.textContent.includes('Net sonuç'))grid.insertBefore(resultCard,cashCard);
  const ordered=grid.querySelectorAll(':scope > .card'),cash=Number(result.data.cash_flow||0),cashElement=ordered[2],netElement=ordered[3];
  const setCard=(card,name,positive)=>{const label=card?.querySelector('.label'),metric=card?.querySelector('.metric');if(label)label.innerHTML=`${name} <span style="color:${positive?'#4fa879':'#e56b72'};font-size:16px;margin-left:8px">${positive?'▲':'▼'}</span>`;if(metric){metric.classList.toggle('positive',positive);metric.classList.toggle('negative',!positive)}};
  setCard(cashElement,'Net nakit akışı',cash>=0);if(netElement)setCard(netElement,'Net ciro',netElement.querySelector('.metric')?.classList.contains('positive'));setCard(ordered[0],'Brüt ciro',true);setCard(ordered[1],'Gider',false);
  const metric=cashElement?.querySelector('.metric');if(metric)metric.textContent=money(cash);
}
refreshDashboardCashFlow();setInterval(refreshDashboardCashFlow,2000);
