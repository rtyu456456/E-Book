package com.fp.eb.model;

import java.util.List;

public class CommunityPinned {
	
	private List<CommunityLikeDTO> pinnedCommu;
	
	public CommunityPinned() {
		// TODO Auto-generated constructor stub
	}

	public CommunityPinned(List<CommunityLikeDTO> pinnedCommu) {
		super();
		this.pinnedCommu = pinnedCommu;
	}


	public List<CommunityLikeDTO> getPinnedCommu() {
		return pinnedCommu;
	}

	public void setPinnedCommu(List<CommunityLikeDTO> pinnedCommu) {
		this.pinnedCommu = pinnedCommu;
	}
	
	

}
