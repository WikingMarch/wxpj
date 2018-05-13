package ServiceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Service.baoxianguiService;



import dao.baoxianguiDao;
import entity.baoxianguiEntity;


@Service("baoxianService")//
public class baoxianguiServiceImp implements baoxianguiService {
    
	@Autowired
    private baoxianguiDao baoxianDao;
    @Override
	public void insertbaoxiangui(baoxianguiEntity entity) {
		// TODO Auto-generated method stub
		baoxianDao.saveOrupdate(entity);
	}
    
	
	
}
