from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date, Enum, ForeignKey, Text
from sqlalchemy.orm import relationship

Base = declarative_base()

class DimTime(Base):
    __tablename__ = 'DimTime'
    date_key = Column(Integer, primary_key=True)
    date = Column(Date)
    year = Column(Integer)
    quarter = Column(Integer)
    month = Column(Integer)
    day = Column(Integer)
    weekday = Column(String)

class DimCategories(Base):
    __tablename__ = 'DimCategories'
    category_key = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False, unique=True)

class DimUsers(Base):
    __tablename__ = 'DimUsers'
    user_key = Column(Integer, primary_key=True)
    username = Column(String)
    creation_date = Column(Date)
    deletion_date = Column(Date)
    group_key = Column(Integer, ForeignKey('DimUserGroups.group_key'))

class DimUserGroups(Base):
    __tablename__ = 'DimUserGroups'
    group_key = Column(Integer, primary_key=True)
    name = Column(String, unique=True)

class DimItems(Base):
    __tablename__ = 'DimItems'
    item_key = Column(Integer, primary_key=True)
    name = Column(String)
    description = Column(Text)
    creation_date = Column(Date)
    deletion_date = Column(Date)
    status = Column(Enum('free', 'borrowed', 'lost'))
    primary_location = Column(String)
    category_key = Column(Integer, ForeignKey('DimCategories.category_key'))
    category = relationship("DimCategories")

class FactRentalTransactions(Base):
    __tablename__ = 'FactRentalTransactions'
    transaction_id = Column(Integer, primary_key=True)
    rental_date_key = Column(Integer, ForeignKey('DimTime.date_key'))
    due_date_key = Column(Integer, ForeignKey('DimTime.date_key'))
    return_date_key = Column(Integer, ForeignKey('DimTime.date_key'))
    
    user_key = Column(Integer, ForeignKey('DimUsers.user_key'), nullable=False)
    borrowed_by_key = Column(Integer, ForeignKey('DimUsers.user_key'), nullable=False)
    
    item_key = Column(Integer, ForeignKey('DimItems.item_key'))
    rental_date = relationship("DimTime", foreign_keys=[rental_date_key])
    due_date = relationship("DimTime", foreign_keys=[due_date_key])
    return_date = relationship("DimTime", foreign_keys=[return_date_key])
    
    category_key = Column(Integer, ForeignKey('DimCategories.category_key'))
    category = relationship("DimCategories")
